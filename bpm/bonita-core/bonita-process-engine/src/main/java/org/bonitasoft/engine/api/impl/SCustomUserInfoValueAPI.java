/**
 * Copyright (C) 2014 BonitaSoft S.A.
 * BonitaSoft, 32 rue Gustave Eiffel - 38000 Grenoble
 * This library is free software; you can redistribute it and/or modify it under the terms
 * of the GNU Lesser General Public License as published by the Free Software Foundation
 * version 2.1 of the License.
 * This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 * You should have received a copy of the GNU Lesser General Public License along with this
 * program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth
 * Floor, Boston, MA 02110-1301, USA.
 */
package org.bonitasoft.engine.api.impl;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.bonitasoft.engine.commons.exceptions.SBonitaException;
import org.bonitasoft.engine.exception.UpdateException;
import org.bonitasoft.engine.identity.CustomUserInfoValue;
import org.bonitasoft.engine.identity.CustomUserInfoValueUpdater;
import org.bonitasoft.engine.identity.IdentityService;
import org.bonitasoft.engine.identity.SIdentityException;
import org.bonitasoft.engine.identity.model.SCustomUserInfoValue;
import org.bonitasoft.engine.identity.model.builder.SCustomUserInfoValueBuilderFactory;
import org.bonitasoft.engine.identity.model.builder.SCustomUserInfoValueUpdateBuilderFactory;
import org.bonitasoft.engine.persistence.FilterOption;
import org.bonitasoft.engine.persistence.OrderByOption;
import org.bonitasoft.engine.persistence.QueryOptions;
import org.bonitasoft.engine.persistence.SBonitaSearchException;
import org.bonitasoft.engine.search.SearchOptions;
import org.bonitasoft.engine.search.SearchResult;
import org.bonitasoft.engine.search.descriptor.SearchEntityDescriptor;
import org.bonitasoft.engine.search.identity.SearchCustomUserInfoValues;

/**
 * @author Vincent Elcrin
 */
public class SCustomUserInfoValueAPI {

    private SCustomUserInfoValueBuilderFactory creatorFactory;

    private SCustomUserInfoValueUpdateBuilderFactory updaterFactory;

    private final IdentityService service;

    public SCustomUserInfoValueAPI(IdentityService service,
            SCustomUserInfoValueBuilderFactory creatorFactory,
            SCustomUserInfoValueUpdateBuilderFactory updaterFactory) {
        this.creatorFactory = creatorFactory;
        this.updaterFactory = updaterFactory;
        this.service = service;
    }

    public SearchResult<CustomUserInfoValue> search(SearchEntityDescriptor descriptor, final SearchOptions options) throws SBonitaException {
        SearchCustomUserInfoValues search = new SearchCustomUserInfoValues(service, descriptor, options);
        search.execute();
        return search.getResult();
    }

    public SCustomUserInfoValue update(SCustomUserInfoValue value, CustomUserInfoValueUpdater updater) throws SIdentityException {
        assertNoNull("Cannot update a value based on null parameters", value, updater);
        service.updateCustomUserInfoValue(value, updaterFactory.createNewInstance()
                .updateValue(updater.getValue())
                .done());
        return service.getCustomUserInfoValue(value.getId());
    }

    public SCustomUserInfoValue set(long definitionId, long userId, String value) throws
            SIdentityException,
            UpdateException,
            SBonitaSearchException {

        SCustomUserInfoValue customUserInfoValue = searchValue(definitionId, userId);
        if(value == null || value.isEmpty()) {
            delete(customUserInfoValue);
//            customUserInfoValue.setValue(value);
            return customUserInfoValue;
        }
        if (customUserInfoValue != null) {
            return update(customUserInfoValue, new CustomUserInfoValueUpdater(value));
        }
        return create(definitionId, userId, value);
    }

    public SCustomUserInfoValue create(long definitionId, long userId, String value) throws SIdentityException {
        return service.createCustomUserInfoValue(creatorFactory.createNewInstance()
                .setDefinitionId(definitionId)
                .setUserId(userId)
                .setValue(value)
                .done());
    }

    public void delete(SCustomUserInfoValue value) throws SIdentityException {
        service.deleteCustomUserInfoValue(value);
    }

    private SCustomUserInfoValue searchValue(long definitionId, long userId) throws SBonitaSearchException {
        List<SCustomUserInfoValue> result = service.searchCustomUserInfoValue(new QueryOptions(
                0,
                1,
                Collections.<OrderByOption>emptyList(),
                Arrays.asList(
                        new FilterOption(SCustomUserInfoValue.class, "definitionId", definitionId),
                        new FilterOption(SCustomUserInfoValue.class, "userId", userId)),
                null));
        if(result.size() == 0) {
            return null;
        }
        return result.get(0);
    }

    private void assertNoNull(String message, Object... objects) {
        for (Object object : objects) {
            if (object == null) {
                throw new IllegalArgumentException(message);
            }
        }
    }
}
